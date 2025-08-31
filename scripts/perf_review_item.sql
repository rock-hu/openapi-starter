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
-- Name: perf_review_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE perf_review_item (
    employee_party_id character varying(20) NOT NULL,
    employee_role_type_id character varying(20) NOT NULL,
    perf_review_id character varying(20) NOT NULL,
    perf_review_item_seq_id character varying(20) NOT NULL,
    perf_review_item_type_id character varying(20),
    perf_rating_type_id character varying(20),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.perf_review_item OWNER TO ofbiz;

--
-- Name: perf_review_item pk_perf_review_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review_item
    ADD CONSTRAINT pk_perf_review_item PRIMARY KEY (employee_party_id, employee_role_type_id, perf_review_id, perf_review_item_seq_id);


--
-- Name: perf_rvitm_eptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rvitm_eptrl ON perf_review_item USING btree (employee_party_id, employee_role_type_id);


--
-- Name: perf_rvitm_epty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rvitm_epty ON perf_review_item USING btree (employee_party_id);


--
-- Name: perf_rvitm_pfrv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rvitm_pfrv ON perf_review_item USING btree (employee_party_id, employee_role_type_id, perf_review_id);


--
-- Name: prf_rvw_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prf_rvw_itm_txcrts ON perf_review_item USING btree (created_tx_stamp);


--
-- Name: prf_rvw_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prf_rvw_itm_txstmp ON perf_review_item USING btree (last_updated_tx_stamp);


--
-- Name: perf_review_item perf_rvitm_eptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review_item
    ADD CONSTRAINT perf_rvitm_eptrl FOREIGN KEY (employee_party_id, employee_role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: perf_review_item perf_rvitm_epty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review_item
    ADD CONSTRAINT perf_rvitm_epty FOREIGN KEY (employee_party_id) REFERENCES party(party_id);


--
-- Name: perf_review_item perf_rvitm_pfrv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review_item
    ADD CONSTRAINT perf_rvitm_pfrv FOREIGN KEY (employee_party_id, employee_role_type_id, perf_review_id) REFERENCES perf_review(employee_party_id, employee_role_type_id, perf_review_id);


--
-- PostgreSQL database dump complete
--

