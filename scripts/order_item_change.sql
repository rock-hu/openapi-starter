--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_item_change; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_change (
    order_item_change_id character varying(20) NOT NULL,
    order_id character varying(20),
    order_item_seq_id character varying(20),
    change_type_enum_id character varying(20),
    change_datetime timestamp with time zone,
    change_user_login character varying(255),
    quantity numeric(18,6),
    cancel_quantity numeric(18,6),
    unit_price numeric(18,2),
    item_description character varying(255),
    reason_enum_id character varying(20),
    change_comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_change OWNER TO ofbiz;

--
-- Name: order_item_change pk_order_item_change; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_change
    ADD CONSTRAINT pk_order_item_change PRIMARY KEY (order_item_change_id);


--
-- Name: order_itch_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itch_oitm ON order_item_change USING btree (order_id, order_item_seq_id);


--
-- Name: order_itch_reas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itch_reas ON order_item_change USING btree (reason_enum_id);


--
-- Name: order_itch_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itch_type ON order_item_change USING btree (change_type_enum_id);


--
-- Name: order_itch_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itch_user ON order_item_change USING btree (change_user_login);


--
-- Name: orr_itm_chg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_chg_txcrts ON order_item_change USING btree (created_tx_stamp);


--
-- Name: orr_itm_chg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_chg_txstmp ON order_item_change USING btree (last_updated_tx_stamp);


--
-- Name: order_item_change order_itch_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_change
    ADD CONSTRAINT order_itch_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: order_item_change order_itch_reas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_change
    ADD CONSTRAINT order_itch_reas FOREIGN KEY (reason_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: order_item_change order_itch_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_change
    ADD CONSTRAINT order_itch_type FOREIGN KEY (change_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: order_item_change order_itch_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_change
    ADD CONSTRAINT order_itch_user FOREIGN KEY (change_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

