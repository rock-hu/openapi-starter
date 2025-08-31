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
-- Name: allocation_plan_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE allocation_plan_item (
    plan_id character varying(20) NOT NULL,
    plan_item_seq_id character varying(20) NOT NULL,
    status_id character varying(20),
    plan_method_enum_id character varying(20),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    product_id character varying(20) NOT NULL,
    allocated_quantity numeric(18,6),
    priority_seq_id character varying(20),
    created_by_user_login character varying(255),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.allocation_plan_item OWNER TO ofbiz;

--
-- Name: allocation_plan_item pk_allocation_plan_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT pk_allocation_plan_item PRIMARY KEY (plan_id, plan_item_seq_id, product_id);


--
-- Name: alc_pln_itm_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_cbul ON allocation_plan_item USING btree (created_by_user_login);


--
-- Name: alc_pln_itm_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_enum ON allocation_plan_item USING btree (plan_method_enum_id);


--
-- Name: alc_pln_itm_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_hdr ON allocation_plan_item USING btree (plan_id, product_id);


--
-- Name: alc_pln_itm_lmul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_lmul ON allocation_plan_item USING btree (last_modified_by_user_login);


--
-- Name: alc_pln_itm_odrhdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_odrhdr ON allocation_plan_item USING btree (order_id);


--
-- Name: alc_pln_itm_odritm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_odritm ON allocation_plan_item USING btree (order_id, order_item_seq_id);


--
-- Name: alc_pln_itm_sts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_itm_sts ON allocation_plan_item USING btree (status_id);


--
-- Name: alln_pln_itm_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alln_pln_itm_txcrs ON allocation_plan_item USING btree (created_tx_stamp);


--
-- Name: alln_pln_itm_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alln_pln_itm_txstp ON allocation_plan_item USING btree (last_updated_tx_stamp);


--
-- Name: allocation_plan_item alc_pln_itm_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_cbul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: allocation_plan_item alc_pln_itm_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_enum FOREIGN KEY (plan_method_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: allocation_plan_item alc_pln_itm_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_hdr FOREIGN KEY (plan_id, product_id) REFERENCES allocation_plan_header(plan_id, product_id);


--
-- Name: allocation_plan_item alc_pln_itm_lmul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_lmul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: allocation_plan_item alc_pln_itm_odrhdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_odrhdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: allocation_plan_item alc_pln_itm_odritm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_odritm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: allocation_plan_item alc_pln_itm_sts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_item
    ADD CONSTRAINT alc_pln_itm_sts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

