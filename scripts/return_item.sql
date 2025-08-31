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
-- Name: return_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_item (
    return_id character varying(20) NOT NULL,
    return_item_seq_id character varying(20) NOT NULL,
    return_reason_id character varying(20),
    return_type_id character varying(20),
    return_item_type_id character varying(20),
    product_id character varying(20),
    description character varying(255),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    status_id character varying(20),
    expected_item_status character varying(20),
    return_quantity numeric(18,6),
    received_quantity numeric(18,6),
    return_price numeric(18,2),
    return_item_response_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_item OWNER TO ofbiz;

--
-- Name: return_item pk_return_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT pk_return_item PRIMARY KEY (return_id, return_item_seq_id);


--
-- Name: return_item_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_item_txcrts ON return_item USING btree (created_tx_stamp);


--
-- Name: return_item_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_item_txstmp ON return_item USING btree (last_updated_tx_stamp);


--
-- Name: rtn_item_itstt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_itstt ON return_item USING btree (expected_item_status);


--
-- Name: rtn_item_odr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_odr ON return_item USING btree (order_id);


--
-- Name: rtn_item_odrit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_odrit ON return_item USING btree (order_id, order_item_seq_id);


--
-- Name: rtn_item_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_prod ON return_item USING btree (product_id);


--
-- Name: rtn_item_reason; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_reason ON return_item USING btree (return_reason_id);


--
-- Name: rtn_item_resp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_resp ON return_item USING btree (return_item_response_id);


--
-- Name: rtn_item_rtn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_rtn ON return_item USING btree (return_id);


--
-- Name: rtn_item_sttsit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_sttsit ON return_item USING btree (status_id);


--
-- Name: rtn_item_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_item_type ON return_item USING btree (return_item_type_id);


--
-- Name: rtn_itm_byorditm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_byorditm ON return_item USING btree (order_id, order_item_seq_id);


--
-- Name: rtn_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_type ON return_item USING btree (return_type_id);


--
-- Name: return_item rtn_item_itstt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_itstt FOREIGN KEY (expected_item_status) REFERENCES status_item(status_id);


--
-- Name: return_item rtn_item_odr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_odr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: return_item rtn_item_odrit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_odrit FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: return_item rtn_item_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: return_item rtn_item_reason; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_reason FOREIGN KEY (return_reason_id) REFERENCES return_reason(return_reason_id);


--
-- Name: return_item rtn_item_resp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_resp FOREIGN KEY (return_item_response_id) REFERENCES return_item_response(return_item_response_id);


--
-- Name: return_item rtn_item_rtn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_rtn FOREIGN KEY (return_id) REFERENCES return_header(return_id);


--
-- Name: return_item rtn_item_sttsit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_sttsit FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: return_item rtn_item_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_item_type FOREIGN KEY (return_item_type_id) REFERENCES return_item_type(return_item_type_id);


--
-- Name: return_item rtn_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item
    ADD CONSTRAINT rtn_type FOREIGN KEY (return_type_id) REFERENCES return_type(return_type_id);


--
-- PostgreSQL database dump complete
--

