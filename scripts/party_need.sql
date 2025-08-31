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
-- Name: party_need; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_need (
    party_need_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    party_type_id character varying(20),
    need_type_id character varying(20),
    communication_event_id character varying(20),
    product_id character varying(20),
    product_category_id character varying(20),
    visit_id character varying(20),
    datetime_recorded timestamp with time zone,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_need OWNER TO ofbiz;

--
-- Name: party_need pk_party_need; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT pk_party_need PRIMARY KEY (party_need_id, party_id, role_type_id);


--
-- Name: party_need_cmev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_cmev ON party_need USING btree (communication_event_id);


--
-- Name: party_need_ndtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_ndtp ON party_need USING btree (need_type_id);


--
-- Name: party_need_pcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_pcat ON party_need USING btree (product_category_id);


--
-- Name: party_need_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_prod ON party_need USING btree (product_id);


--
-- Name: party_need_pttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_pttp ON party_need USING btree (party_type_id);


--
-- Name: party_need_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_pty ON party_need USING btree (party_id);


--
-- Name: party_need_rtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_rtyp ON party_need USING btree (role_type_id);


--
-- Name: party_need_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_txcrts ON party_need USING btree (created_tx_stamp);


--
-- Name: party_need_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_need_txstmp ON party_need USING btree (last_updated_tx_stamp);


--
-- Name: party_need party_need_cmev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_cmev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: party_need party_need_ndtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_ndtp FOREIGN KEY (need_type_id) REFERENCES need_type(need_type_id);


--
-- Name: party_need party_need_pcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_pcat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: party_need party_need_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: party_need party_need_pttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_pttp FOREIGN KEY (party_type_id) REFERENCES party_type(party_type_id);


--
-- Name: party_need party_need_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_need party_need_rtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_need
    ADD CONSTRAINT party_need_rtyp FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

